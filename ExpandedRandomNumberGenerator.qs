namespace ExpandedRandomNumberGenerator {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    @EntryPoint()
    operation Main() : Int {
        let max = 5000;
        Message($"Sampling a random number between 0 and {max}");

        // generate random number in the 0...max range 
        return GenerateRandomNumberInRange(max);
    }

    // Generates a random number betwen 0 and max 
    operation GenerateRandomNumberInRange(max : Int) : Int {
        // calculate and store the number of bits needs to represet the max
        mutable bits = [];
        let nBits = BitSizeI(max);
        for idxBit in 1..nBits {
            set bits += [GenerateRandomBit()];
        }
        let sample = ResultArrayAsInt(bits);

        return sample > max ? GenerateRandomNumberInRange(max) | sample;
    }

    operation GenerateRandomBit() : Result {
        // allocate a qubit
        use q = Qubit();

        // set the qubit into superposition of 0 and 1 using Hadamard
        H(q);

        // measure the value of the qubit
        let result = M(q);

        // release the qubit
        Reset(q);

        return result;
    }
}