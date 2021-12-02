import {
    parseRequestUrl,
    showLoading,
    showMessage,
    hideLoading,
} from '../utils.js';
import { getProduct, updateProduct, uploadProductImage } from '../api/product.js';

const ProductEditScreen = {
    after_render: () => {
        const request = parseRequestUrl();
        document
            .getElementById('edit-product-form')
            .addEventListener('submit', async (e) => {
                e.preventDefault();
                showLoading();
                const data = await updateProduct({
                    id: request.id,
                    name: document.getElementById('name').value,
                    price: document.getElementById('price').value,
                    image_display: document.getElementById('image').value,
                    code: document.getElementById('code').value,
                    category: document.getElementById('category').value,
                    countInStock: document.getElementById('countInStock').value,
                    detail: document.getElementById('description').value,
                });
                if (data.error) {
                    showMessage(data.error);
                } else {
                    hideLoading();
                    document.location.hash = '/productlist';
                }
            });
        document
            .getElementById('image-file')
            .addEventListener('change', async (e) => {
                const file = e.target.files[0];
                const formData = new FormData();
                formData.append('image', file);
                showLoading();
                const data = await uploadProductImage(formData);
                hideLoading();
                showMessage('Image uploaded successfully.');
                document.getElementById('image').value = data.image;
                // if (data.error) {
                // 	showMessage(data.error);
                // } else {
                // 	showMessage('Image uploaded successfully.');
                // 	document.getElementById('image').value = data.image;
                // }
            });
    },
    render: async () => {
        const request = parseRequestUrl();
        const product = await getProduct(request.id);
        console.log(product);
        return `
    <div class="content-admin">
      <div class="form-container">
        <form id="edit-product-form">
        	<a href="/#/productlist"><i class="fas fa-arrow-left"></i></a>
        	<h1>Edit Product ${product.id}</h1><br>
        	
          <ul class="form-product">
            
            <li>
              <label for="name">Name</label>
              <input type="text" name="name" value="${product.name}" id="name" />
            </li>
            <li>
              <label for="price">Price</label>
              <input type="number" name="price" value="${product.price}" id="price" />
            </li>
            <li>
              <label for="image">Image (680 x 830)</label>
              <input type="text" name="image" value="${product.image_display}" id="image" />
              <input type="file" name="image-file" id="image-file" />
            </li>
            <li>
              <label for="code">Code</label>
              <input type="text" name="code" value="${product.code}" id="code" />
            </li>
            <li>
              <label for="countInStock">Count In Stock</label>
              <input type="text" name="countInStock" value="${product.countInStock}" id="countInStock" />
            </li>
            <li>
              <label for="category">Category</label>
              <input type="text" name="category" value="${product.categories_id}" id="category" />
            </li>
            <li>
              <label for="description">Description</label>
              <textarea name="description" id="description" style="width: 899px; height: 342px;">${product.detail}</textarea>
              
            </li>
            <li>
              <button type="submit" class="primary">Update</button>
            </li>
          </ul>
        </form>
      </div>

    </div>
    `;
    },
};
export default ProductEditScreen;