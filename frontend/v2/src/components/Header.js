import { getUserInfo } from '../localStorage.js';
import { parseRequestUrl } from '../utils.js';

const Header = {
	render() {
		const { full_name, isAdmin } = getUserInfo();
		const { value } = parseRequestUrl();
		return ` 
  <div class="brand">
    <button id="aside-open-button">
      &#9776;
    </button>
    <a href="/#/">Farm</a>
  </div>
  <div class="search">
  <form class="search-form"  id="search-form">
    <input type="text" name="q" id="q" value="${
		value || ''
	}" placeholder="tìm kiếm..."/> 
    <button type="submit">Search</button>
  </form>        
  </div>
	<div>
	${full_name ? `<a href="/#/profile">${full_name}</a>` : `<a href="/#/login">Login</a>`}
	  <a href="/#/cart">Cart</a>
	  ${isAdmin == '1' ? `<a href="/#/dashboard">Dashboard</a>` : ''}
	</div>`;
	},
	after_render: () => {
		document
			.getElementById('search-form')
			.addEventListener('submit', async (e) => {
				e.preventDefault();
				const searchKeyword = document.getElementById('q').value;
				document.location.hash = `/?q=${searchKeyword}`;
			});

		document
			.getElementById('aside-open-button')
			.addEventListener('click', async () => {
				document
					.getElementById('aside-container')
					.classList.add('open');
			});
	},
};
export default Header;
