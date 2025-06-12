import numpy as np

def multiply_arrays(request):
    request_args = request.args

    # Example: ?a=1,2,3&b=4,5,6
    a_str = request_args.get("a", "")
    b_str = request_args.get("b", "")

    try:
        arr1 = np.array([float(x) for x in a_str.split(",")])
        arr2 = np.array([float(x) for x in b_str.split(",")])

        if arr1.shape != arr2.shape:
            return {"error": "Arrays must be of the same shape"}, 400

        product = arr1 * arr2

        return {
            "array1": arr1.tolist(),
            "array2": arr2.tolist(),
            "product": product.tolist()
        }

    except Exception as e:
        return {"error": str(e)}, 400
