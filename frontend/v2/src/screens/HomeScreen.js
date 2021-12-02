import Rating from '../components/Rating.js';
import { getProducts } from '../api/product.js';
import { getImage_Sliders } from '../api/image_slider.js';
import { getCategory } from '../api/category.js';
import { parseRequestUrl } from '../utils.js';


const HomeScreen = {
    render: async () => {

        const { value } = parseRequestUrl();
        const products = await getProducts({ searchKeyword: value });
        if (products.error) {
            return `<div class="error">${products.error}</div>`;
        }

		const image_sliders = await getImage_Sliders({ searchKeyword: value });
        if (image_sliders.error) {
            return `<div class="error">${image_sliders.error}</div>`;
        }
		
		return `

		<section class="auto-slider">
			<div id="slider">
				<figure>
				${image_sliders
					.map(
						(image_slider) => `
						<img src="${image_slider.file}" alt="Image">`
						)
						.join('\n')}
						
					'
				</figure>				
			</div>
		</section>
		
		<div class="container-marketing">
            <div class="row">
                <div class="marketing-detail">
                    <img class="marketing-img" width=40"
                        src="https://i.pinimg.com/originals/af/a8/e9/afa8e91461443d752103144ae24d3d17.jpg">
                    <h2>Đặt hàng</h2>
                    <p>Chọn sản phẩm và Đặt hàng.</p>
                </div>
                <div class="marketing-detail">
                    <img class="marketing-img" width=40"
                        src="https://i.pinimg.com/originals/bd/6e/4d/bd6e4d0af68a346adfe863e7b3a223a6.jpg">
                    <h2>Tạo đơn hàng</h2>
                    <p>Theo dõi đơn hàng của bạn.</p>
                </div>
                <div class="marketing-detail">
                    <img class="marketing-img" width=40"
                        src="https://i.pinimg.com/originals/47/9c/b5/479cb5fd2270b662084e65bdcb849ae8.jpg">
                    <h2>Giao hàng</h2>
                    <p>Giao hàng nhanh chóng.</p>
                </div>
            </div>
        </div>

		<ul class="products">
		${products
				.map(
					(product) => `
		<li>
			<div class="product">
				<a href="/#/product/${product.code ? product.code : product.id}">
					<img src="${product.image_display}" alt="${product.name}" />
				</a>
				<div class="product-name">
				<a href="/#/product/${product.code ? product.code : product.id}">
					${product.name}
				</a>
				</div>
				<div class="product-rating">
				${Rating.render({
						value: product.rating,
						text: `${product.numReviews} reviews`,
					})}
				</div>
				<div class="product-brand">
				${product.categories_id}
				</div>
				<div class="product-price">
				${product.price} VNĐ
				</div>
			</div>
		</li>
  `
		)
		.join('\n')}
		
`;
    },
};
export default HomeScreen;
