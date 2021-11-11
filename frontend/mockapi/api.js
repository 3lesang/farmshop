import apiUrl from './con.js';
export const register = async (user) => {
	try {
		const url = `${apiUrl}/users`;
		const res = await fetch(url, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(user),
		});
		const users = await res.json();
		console.log(users);
	} catch (error) {
		console.log(error);
	}
};
export const deleteUser = async (id) => {
	try {
		const res = await fetch(`http://localhost:3000/users/${id}`, {
			method: 'DELETE',
			headers: {
				'Content-Type': 'application/json',
			},
		});
		const users = await res.json();
		console.log(users);
	} catch (error) {
		console.log(error);
	}
};
