import { parseRequestUrl } from '../utils.js';
import { getCategories } from '../api/category.js';
const Aside = {
    render: async () => {

        const { value } = parseRequestUrl();
        const categories = await getCategories({ searchKeyword: value });
        if (categories.error) {
            return `<div class="error">${categories.error}</div>`;
        }
        console.log(categories);



        return `
      <div class="aside-header">
        <div>SHOP BY CATEGORY</div>
          <button class="aside-close-button" id="aside-close-button">&#x274C;</button>
      </div>
      <div class="aside-body">
        <ul class="categories">
          ${categories
            .map(
              (category) => `<li>
         <a href="/#/?q=${category.name}">${category.name}
          <span><i class="fa fa-chevron-right"></i></span>
         </a>
            </li>`
          )
         .join('\n')}
        </ul>
      </div>`;
    },
    after_render: async () => {
        document.getElementById('aside-container').classList.remove('open');
        document
            .getElementById('aside-close-button')
            .addEventListener('click', async () => {
                document
                    .getElementById('aside-container')
                    .classList.remove('open');
            });
    },
};

export default Aside;