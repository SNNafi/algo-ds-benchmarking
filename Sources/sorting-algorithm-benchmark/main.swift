//
//  main.swift
//  
//
//  Created by Shahriar Nasim Nafi on 2/7/22.
//

// swift run -c release sorting-algorithm-benchmark run --cycles 3 sorting-results
// swift run -c release sorting-algorithm-benchmark render sorting-results sorting-chart.png

import AlgoDSBenchmarking
import CollectionsBenchmark


var benchmark = Benchmark(title: "Sorting Algorithm")

benchmark.addSimple(
    title: "Insertion Sort",
    input: [Int].self
) { input in
    blackHole(input.insertionSorted())
}

benchmark.addSimple(
    title: "Merge Sort",
    input: [Int].self
) { input in
    blackHole(input.mergeSorted())
}


benchmark.add(
    title: "Quick Sort",
    input: [Int].self
) { input in
    return { timer in
        var array = input
        array.reserveCapacity(0) // Force unique storage
        timer.measure {
            array.quickSort()
        }
        precondition(array.elementsEqual(0 ..< input.count))
    }
}

benchmark.addSimple(
    title: "Swift Default Sort",
    input: [Int].self
) { input in
    blackHole(input.sorted())
}

benchmark.main()
