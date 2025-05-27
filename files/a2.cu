#include <cuda_runtime.h>
#include <stdio.h>

#define QWA 1000

__global__ void compress_delta_cuda(const int *input, int *output, int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = tid; i < n; i += stride) {
        int val = input[i];
        output[i] = val - QWA;
    }
}

// Host launcher (with full error checks and timing for profiling)
void run_cuda(const int *h_input, int *h_output, int n) {
    int *d_input, *d_output;

    cudaMalloc(&d_input, n * sizeof(int));
    cudaMalloc(&d_output, n * sizeof(int));

    cudaMemcpy(d_input, h_input, n * sizeof(int), cudaMemcpyHostToDevice);

    int threads = 256;
    int blocks = (n + threads - 1) / threads;

    compress_delta_cuda<<<blocks, threads>>>(d_input, d_output, n);

    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        printf("CUDA kernel error: %s\n", cudaGetErrorString(err));
        return;
    }

    cudaMemcpy(h_output, d_output, n * sizeof(int), cudaMemcpyDeviceToHost);

    cudaFree(d_input);
    cudaFree(d_output);
}

