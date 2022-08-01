# IDX file format

The IDX file format is a simple format for vectors and multidimensional matrices of various numerical types.

The basic format according to http://yann.lecun.com/exdb/mnist/ is:

```
magic number
size in dimension 1
size in dimension 2
size in dimension 3
....
size in dimension N
data
```

The magic number is four bytes long. The first 2 bytes are always 0.

The third byte codes the type of the data:

```
0x08: unsigned byte
0x09: signed byte
0x0B: short (2 bytes)
0x0C: int (4 bytes)
0x0D: float (4 bytes)
0x0E: double (8 bytes)
```

The fouth byte codes the number of dimensions of the vector/matrix: 1 for vectors, 2 for matrices....

The sizes in each dimension are 4-byte integers (big endian, like in most non-Intel processors).

The data is stored like in a C array, i.e. the index in the last dimension changes the fastest.

## Behaviour

If the storage format indicates that there are more than 2 dimensions, the resulting Matrix accumulates dimensions 2 and higher in the columns. For example, with three dimensions of size n1, n2 and n3, respectively, the resulting Matrix object will have n1 rows and n2×n3 columns.

## Example

The training and testing data of the MNIST database of handwritten digits at http://yann.lecun.com/exdb/mnist/ is stored in compressed IDX formatted files.

Reading the uncompressed file train-images-idx3-ubyte available at http://yann.lecun.com/exdb/mnist/ with 60000 images of 28×28 pixel data, will result in a new Matrix object with 60000 rows and 784 (=28×28) columns. Each cell will contain a number in the interval from 0 to 255.

Reading the uncompressed file train-labels-idx1-ubyte with 60000 labels will result in a new Matrix object with 1 row and 60000 columns. Each cell will contain a number in the interval from 0 to 9.

## TRAINING SET IMAGE FILE (train-images-idx3-ubyte):

```
[offset] [type] [value] [description]
0000 32 bit integer 0x00000803(2051) magic number
0004 32 bit integer 60000 number of images
0008 32 bit integer 28 number of rows
0012 32 bit integer 28 number of columns
0016 unsigned byte ?? pixel
0017 unsigned byte ?? pixel
……..
xxxx unsigned byte ?? pixel
```
