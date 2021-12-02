const Footer = {
	render: (props) => {
		return `
    <link rel="preconnect" href="https://fonts.gstatic.com">
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="style.css">
            <div class="container">
             <!--Bắt Đầu Nội Dung Giới Thiệu-->
             <div class="noi-dung about">
                 <h2>Về Chúng Tôi</h2>
                 <p>FarmShop chuyên cung cấp các loại rau củ quả nhập khẩu trực tiếp từ Châu Âu, Nam Phi, Nhật Bản, Hàn Quốc và các loại Trái cây Miền Tây với chất lượng tốt nhất!<hr>  </p>
                 <ul class="social-icon">
                     <li><a href=""><i class="fa fa-facebook"></i></a></li>
                     <li><a href=""><i class="fa fa-twitter"></i></a></li>
                     <li><a href=""><i class="fa fa-instagram"></i></a></li>
                     <li><a href=""><i class="fa fa-youtube"></i></a></li>
                 </ul>
             </div>
             <!--Kết Thúc Nội Dung Giới Thiệu-->
             <!--Bắt Đầu Nội Dung Đường Dẫn-->
             <div class="noi-dung links">
                 <h2>Chăm sóc khách hàng</h2>
                 <ul>
                     <li><a href="#">Trang Chủ</a></li>
                     <li><a href="#">Về Chúng Tôi</a></li>
                     <li><a href="#">Dịch Vụ</a></li>
                     <li><a href="#">Điều Kiện Chính Sách</a></li>
                 </ul>
             </div>
             <!--Kết Thúc Nội Dung Đường Dẫn-->
             <!--Bắt Đâu Nội Dung Liên Hệ-->
             <div class="noi-dung contact">
                 <h2>Thông Tin Liên Hệ</h2>
                 <ul class="info">
                     <li>
                         <span><i class="fa fa-map-marker"></i></span>
                         <span>Số 1 Võ Văn Ngân<br />
                             Quận 1, Thành Phố Hồ Chí Minh</span>
                     </li>
                     <li>
                         <span><i class="fa fa-phone"></i></span>
                         <p><a href="#">+84 123 456 789</a>
                             <br />
                             <a href="#">+84 987 654 321</a></p>
                     </li>
                     <li>
                         <span><i class="fa fa-envelope"></i></span>
                         <p><a href="#">farmshop@gmail.com</a></p>
                    </li>
                    
                 </ul>
             </div>
         </div>
    `;
	},
	after_render: async () => {
		document.getElementById('footer-container').classList.remove('open');
	},
};
export default Footer;
