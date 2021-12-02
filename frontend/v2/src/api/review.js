export const createReview = async (productId, review) => {
    try {
        const url = `${apiUrl}/api/products/${productId}/reviews`;
        const { token } = getUserInfo();
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
            },
            data: review,
        });
        if (response.statusText !== 'OK') {
            throw new Error(response.data.message);
        }
        return response.data;
    } catch (err) {
        return { error: err.response.data.message || err.message };
    }
};