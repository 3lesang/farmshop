import DashboardMenu from '../components/DashboardMenu.js';
import { getProducts, createProduct, deleteProduct } from '../api/product.js';
import { showLoading, hideLoading, rerender, showMessage } from '../utils.js';

const ProductListScreen = {
    after_render: () => {
        document
            .getElementById('create-product-button')
            .addEventListener('click', async () => {
                const id = await createProduct();
                document.location.hash = `/product/${id}/edit`;
            });
        const editButtons = document.getElementsByClassName('edit-button');
        Array.from(editButtons).forEach((editButton) => {
            editButton.addEventListener('click', () => {
                document.location.hash = `/product/${editButton.id}/edit`;
            });
        });
        const deleteButtons = document.getElementsByClassName('delete-button');
        Array.from(deleteButtons).forEach((deleteButton) => {
            deleteButton.addEventListener('click', async () => {
                if (confirm('Are you sure to delete this product?')) {
                    showLoading();
                    const data = await deleteProduct(deleteButton.id);
                    if (data) {
                        const product = document.querySelector(
                            '.product-item' + deleteButton.id
                        );
                        product.remove();
                    } else {
                        showMessage('wrong');
                    }
                    hideLoading();
                }
            });
        });
    },
    render: async () => {
        const products = await getProducts({});
        return `
    <div class="dashboard">
    ${DashboardMenu.render({ selected: 'products' })}
    <div class="dashboard-content">
      <div class="dashboard-header">

      	<button id="create-product-button" class="primary">
        	<i class="fas fa-plus-circle"></i> Create Product
      	</button>
      </div>
      
      <div class="product-list">
        <table>
        	<caption>PRODUCTS</caption>
          <thead>
            <tr>
              <th>ID</th>
              <th>NAME</th>
              <th>PRICE</th>
              <th>CATEGORY</th>
              <th>Code</th>
              <th class="tr-action">ACTION</th>
            <tr>
          </thead>
          <tbody>
            ${products
				.map(
					(product) => `
            <tr class="product-item${product.id}">
              <td>${product.id}</td>
              <td>${product.name}</td>
              <td>${product.price}</td>
              <td>${product.categories_id}</td>
              <td>${product.code}</td>
              <td>
              <button id="${product.id}" class="edit-button"><i class="far fa-edit"></i></button>
              <button id="${product.id}" class="delete-button"><i class="fas fa-trash"></i></button>
              </td>
            </tr>
            `
				)
				.join('\n')}
          </tbody>
        </table>
      </div>
    </div>
  </div>
    `;
    },
};
export default ProductListScreen;