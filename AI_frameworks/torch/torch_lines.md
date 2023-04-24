## Tensors
### Methods on torch module
+ torch.manual_seed(12345)
+ torch.rand(5, 3)
+ torch.ones(4, 6)
+ torch.empty(4, 6)
+ torch.zeros(4, 6)
+ torch.tensor([[1, 2], [3, 4]], dtype=torch.float64)
+ torch.from_numpy(numpy_array)  # makes py_torch_tensor from numpy array
+ 

### Methods on Tensor objects
+ a.to(torch.int16)
+ a.sin_(math.pi)  # in place operation
+ a.clone()  # deep copying of tensors and autograd flag is passed on to the copy.
+ a.detach()
+ a.squeeze(axis)  # removes zeroth dimensions at axis position.
+ a.squeeze_(axis)  # in-place removal of zeroth dimensions at axis position.
+ a.unsqueeze(axis)  # adds new zeroth dimensions at axis position.
+ a.unsqueeze_(axis)  # in-place addition of new zeroth dimensions at axis position.
+ a.numpy()  # converts pytorch tensor to numpy array


### Moving Tensors to GPU
+ torch.cuda.is_available()  # tests, if cuda is available
+ Creating tensors directly on the device of choice
	+ torch.rand(3, 3, device='cuda') or
	+ torch.rand(3, 3, device=my_device) # my_device is defined as follows
		+ my_device = torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu')
+ a.to(my_device)  # move to device of choice, after creation
+ For performing any operation, it is expected that the involved tensors must be on the same device.

## AutoGrad


## Tips
+ Creates tensors directly on the target device
+ 


