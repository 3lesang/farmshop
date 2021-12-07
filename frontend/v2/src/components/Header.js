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
  	<form method="post" id="search-form">
	  <input type="text" class="textbox" placeholder="tìm sản phẩm" name="q" id="q" value="${
		value || ''}">
	  <input title="Search" value="" type="submit" class="button">
	</form>
       
  </div>
	<div>
	${full_name ? `<a href="/#/profile"><i class="far fa-user"></i> ${full_name}</a>` : `<a href="/#/login">Login</a>`}
	  <a href="/#/cart"><i class="fas fa-shopping-cart"></i> Cart</a>
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