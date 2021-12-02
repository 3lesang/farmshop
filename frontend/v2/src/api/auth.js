import { apiUrl } from '../conf.js';
import { getUserInfo } from '../localStorage.js';
export const login = async ({ username, pw }) => {
    try {
        const url = `${apiUrl}/user/login`;
        const response = await fetch(url, {
            method: 'POST',
            header: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                username,
                pw
            }),
        });
        const data = await response.json();
        // console.log(data);
        if (response.statusText !== 'OK') {
            throw new Error(response.Error);
        }
        return data;
    } catch (err) {
        // console.log(err);
        return { error: err.message };
    }
};
export const register = async (user) => {
    try {
        const url = `${apiUrl}/user/register`;
        const res = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(user),
        });
        // console.log(res.statusText);
        if (res.statusText !== 'OK') {
            throw new Error(response.Error);
        }
        const data = await res.json();
        return data;
    } catch (error) {
        return error.message;
    }
};