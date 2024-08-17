namespace QuantumRandomNumberGenerator {
    @EntryPoint()
    operation GenerateRandomBit() : Result {
        // allocate a qubit
        use q = Qubit();

        // set the qubit into superposition of 0 and 1 using Hadamard
        H(q);

        // the quibit, "q" has a 50% chance of being measured at 1 and a 50% chance of being meastured at zero 
        // M measures the qubit and returns the result

        let result = M(q);

        // release the qubit
        Reset(q);

        return result;
    }
}