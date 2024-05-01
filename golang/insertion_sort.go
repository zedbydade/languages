package main

import "fmt"

func InsertSort(arr []int) { 
  for i := 1; i < len(arr); i++ { 
    // key = 7
    // j = 10
    key := arr[i]
    j := i - 1

    for j >= 0 && arr[j] > key { 
      arr[j+1] = arr[j]
      j--
    }
    arr[j+1] = key
  }
}

func main() { 
  arr := []int{10, 7, 1, 12, 50, 22, 14, 79}

  fmt.Println("Array 1", arr)
  InsertSort(arr)
  fmt.Println("Array 2", arr)
}
