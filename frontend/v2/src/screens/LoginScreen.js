import { login } from '../api/auth.js';
import { getUserInfo, setUserInfo } from '../localStorage.js';
import {
	showLoading,
	hideLoading,
	showMessage,
	redirectUser,
} from '../utils.js';

const LoginScreen = {
	after_render: () => {
		document
			.getElementById('signin-form')
			.addEventListener('submit', async (e) => {
				e.preventDefault();
				showLoading();
				const data = await login({
                    	username: document.getElementById('email').value,
                    	pw: document.getElementById('password').value,
                });
				hideLoading();
                console.log(data);
				if (!data.full_name) {
					showMessage(data.mess);
				} else {
					setUserInfo(data);
					redirectUser();
				}
			});
	},
	render: () => {
		if (getUserInfo().full_name) {
			redirectUser();
		}
		return `
    <div class="form-container">
      <form id="signin-form">
        <ul class="form-items">
          <li>
            <h1>Sign In</h1>
          </li>
          <li>
            <label for="email">Email</label>
            <input type="text" name="email" id="email" />
          </li>
          <li>
            <label for="password">Password</label>
            <input type="password" name="password" id="password" />
          </li>
          <li>
            <button type="submit" class="primary">Signin</button>
          </li>
          <li>
            <div>
              New User?
              <a href="/#/register">Create your account </a>
            </div>
          </li>
        </ul>
      </form>
    </div>
    `;
	},
};
export default LoginScreen;
