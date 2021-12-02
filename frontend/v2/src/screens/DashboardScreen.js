import DashboardMenu from '../components/DashboardMenu.js';
import { getSummary } from '../api/summary.js';

let summary = {};
const DashboardScreen = {
    after_render: () => {
        new Chartist.Line(
            '.ct-chart-line', {
                labels: summary.dailyOrders.map((x) => x.id),
                series: [summary.dailyOrders.map((x) => x.total_money)],
            }, {
                showArea: true,
            }
        );
        new Chartist.Pie(
            '.ct-chart-pie', {
                labels: summary.category.map((x) => x.name),
                series: summary.category.map((x) => x.id),
            }, {
                donut: true,
                donutWidth: 60,
                startAngle: 270,
                showLabel: true,
                donutSolid: true,
            }
        );
    },
    render: async () => {
        summary = await getSummary();
        console.log(summary);
        return `
    <div class="dashboard">
    	
      ${DashboardMenu.render({ selected: 'dashboard' })}
      <div class="dashboard-content">
        <h1>Dashboard</h1>
       
        <ul class="summary-items">
          <li>
            <div class="summary-title color1">
              <span><i class="fa fa-users"></i> Users</span>
            </div>
            <div class="summary-body">${summary.user.total}</div>
          </li>
          <li>
            <div class="summary-title color2">
              <span><i class="fas fa-shopping-bag"></i> Orders</span>
            </div>
            <div class="summary-body">${summary.order.total}</div>
          </li>
          <li>
            <div class="summary-title color3">
              <span><i class="fas fa-money-check-alt"></i> Sales</span>
            </div>
            <div class="summary-body">${summary.money.sales} VND</div>
          </li>
        </ul>
        <div class="charts">
          <div>
            <h2>Sales</h2>
            <div class="ct-perfect-fourth ct-chart-line"></div>
          </div>
          <div>
            <h2>Categories</h2>
            <div class="ct-perfect-fourth ct-chart-pie"></div>
          </div>
        </div>          
      </div>
     
    </div>
    `;
    },
};
export default DashboardScreen;