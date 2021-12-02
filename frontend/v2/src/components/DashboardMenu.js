const DashboardMenu = {
    render: (props) => {
        return `
    <div class="dashboard-menu">
      <ul>
        
        <li class="${props.selected === 'dashboard' ? 'selected' : ''}">
          <a href="/#/dashboard"><i class="fas fa-tachometer-alt"></i>&emsp;Dashboard</a>
        </li>
        <li class="${props.selected === 'orders' ? 'selected' : ''}">
          <a href="/#/orderlist"><i class="fas fa-shopping-bag"></i>&emsp;Orders</a>
        </li>
        <li class="${props.selected === 'products' ? 'selected' : ''}">
          <a href="/#/productlist"><i class="fas fa-seedling"></i>&emsp;Products</a>
        </li>
        <li class="${props.selected === 'users' ? 'selected' : ''}">
          <a href="/#/userlist"><i class="far fa-user"></i>&emsp;Accounts</a>
        </li>
        <li>
          <a href="/"><i class="fas fa-sign-out-alt"></i>&emsp;Log out</a>
        </li>
      </ul>
    </div>
    `;
    },
};
export default DashboardMenu;