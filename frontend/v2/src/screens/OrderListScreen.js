import DashboardMenu from '../components/DashboardMenu.js';
import { getOrders, deleteOrder } from '../api/order.js';
import { showLoading, hideLoading, rerender, showMessage } from '../utils.js';

const OrderListScreen = {
    after_render: () => {
        const deleteButtons = document.getElementsByClassName('delete-button');
        Array.from(deleteButtons).forEach((deleteButton) => {
            deleteButton.addEventListener('click', async () => {
                if (confirm('Are you sure to delete this order?')) {
                    showLoading();
                    const data = await deleteOrder(deleteButton.id);
                    if (data.error) {
                        showMessage(data.error);
                    } else {
                        rerender(OrderListScreen);
                    }
                    hideLoading();
                }
            });
        });
        const editButtons = document.getElementsByClassName('edit-button');
        Array.from(editButtons).forEach((editButton) => {
            editButton.addEventListener('click', async () => {
                document.location.hash = `/order/${editButton.id}`;
            });
        });
    },
    render: async () => {
        const orders = await getOrders();
        console.log(orders);
        return `
    <div class="dashboard">
    ${DashboardMenu.render({ selected: 'orders' })}
    <div class="dashboard-content">
      <h1>Orders</h1>
       
      <div class="order-list">
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>DATE</th>
              <th>TOTAL</th>
              <th>USER</th>
              <th>PAID AT</th>
              <th>DELIVERED AT</th>
              <th class="tr-action">ACTION</th>
              
            <tr>
          </thead>
          <tbody>
          	<tr>
          	<td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td>
	              
              </td>
           	</tr>
            ${orders
              .map(
                (order) => `
            <tr>
              <td>${order.id}</td>
              <td>${order.order_date}</td>
              <td>${order.total_money}</td>
              <td>${order.user}</td>
              <td>${order.paidAt || 'No'}</td>
              <td>${order.address || 'No'}</td>
              <td>
	              <button id="${order.id}" class="edit-button"><i class="far fa-edit"></i></button>
	              <button id="${order.id}" class="delete-button"><i class="fas fa-trash"></i></button>
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
export default OrderListScreen;