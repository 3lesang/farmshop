const DashboardMenu = {
    render: (props) => {
        return `
    <div class="dashboard-menu">
      <ul>
        <li>
          <a href="/"><i class="fas fa-home"></i>Home</a>
        </li>
        <li class="${props.selected === 'dashboard' ? 'selected' : ''}">
          <a href="/#/dashboard"><i class="fas fa-tachometer-alt"></i>Dashboard</a>
        </li>
        <li class="${props.selected === 'orders' ? 'selected' : ''}">
          <a href="/#/orderlist"><i class="fas fa-shopping-bag"></i>Orders</a>
        </li>
        <li class="${props.selected === 'products' ? 'selected' : ''}">
          <a href="/#/productlist"><i class="fas fa-seedling"></i>Products</a>
        </li>
        <li class="${props.selected === 'users' ? 'selected' : ''}">
          <a href="/#/userlist"><i class="far fa-user"></i>Accounts</a>
        </li>
      </ul>
    </div>
    `;
    },
};
export default DashboardMenu;