import { register } from '../api/auth.js';
import { getUserInfo } from '../localStorage.js';
import {
	showLoading,
	hideLoading,
	showMessage,
	redirectUser,
} from '../utils.js';

const RegisterScreen = {
	after_render: () => {
		const form = document.getElementById('register-form');
		form.addEventListener('submit', async (e) => {
			e.preventDefault();
			showLoading();
			const full_name = document.getElementById('name').value;
			const username = document.getElementById('email').value;
			const pw = document.getElementById('password').value;
			const user = {
				full_name,
				username,
				pw,
			};
			// console.log(user);
			const res = await register(user);
            console.log(res);
			if (res) {
                hideLoading();
				document.location.hash = '/login';
			} else {
				showMessage(res);
			}
		});
	},
	render: () => {
		if (getUserInfo().name) {
			redirectUser();
		}
		return `
    <div class="form-container">
      <form id="register-form">
        <ul class="form-items">
          <li>
            <h1>Create Account</h1>
          </li>
          <li>
            <label for="name">Name</label>
            <input type="name" name="name" id="name" required="required"/>
          </li>
          <li>
            <label for="email">Email</label>
            <input type="text" name="email" id="email" required="required"/>
          </li>
          <li>
            <label for="password">Password</label>
            <input type="password" name="password" id="password" required="required"/>
          </li>
          <li>
            <label for="repassword">Re-Enter Password</label>
            <input type="password" name="repassword" id="repassword" required="required"/>
          </li>
          <li>
            <button type="submit" class="primary">Register</button>
          </li>
          <li>
            <div>
              Already have an account?
              <a href="/#/login">Sign In </a>
            </div>
          </li>
        </ul>
      </form>
    </div>
    `;
	},
};
export default RegisterScreen;
