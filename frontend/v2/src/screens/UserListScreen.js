import DashboardMenu from '../components/DashboardMenu.js';
import { getUsers, deleteUser } from '../api/user.js';
import { showLoading, hideLoading, rerender, showMessage } from '../utils.js';

const UserListScreen = {
    after_render: () => {
        const deleteButtons = document.getElementsByClassName('delete-button');
        Array.from(deleteButtons).forEach((deleteButton) => {
            deleteButton.addEventListener('click', async () => {
                if (confirm('Are you sure to delete this user?')) {
                    showLoading();
                    const data = await deleteUser(deleteButton.id);
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
        const users = await getUsers({});
        if (!users[0]) {
            showMessage("Can not get users");
            hideLoading();
            return;
        }
        return `
    <div class="dashboard">
    ${DashboardMenu.render({ selected: 'users' })}
    <div class="dashboard-content">
      <h1>Accounts</h1>
      <div class="product-list">
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>NAME</th>
              <th>Username</th>
              <th>Pass</th>
              <th>Admin</th>
              <th class="tr-action">ACTION</th>
            <tr>
          </thead>
          <tbody>
            ${users
				.map(
					(user) => `
            <tr class="product-item${user.id}">
              <td>${user.id}</td>
              <td>${user.full_name}</td>
              <td>${user.username}</td>
              <td></td>
              <td>${user.isAdmin}</td>
              <td>
              <button id="${user.id}" class="delete-button"><i class="fas fa-trash"></i></button>
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
export default UserListScreen;