namespace QuantumRNG {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;

    @EntryPoint()
    operation SampleRandomNumber() : Int {
      let min = 30;
      let max = 50;
      Message($"Sampling a random number between {min} and {max}: ");
      return SampleRandomNumberInRange(min, max);
    }
    
    operation GenerateRandomBit() : Result {
      use q = Qubit();
      H(q);
      return M(q);
    }

    operation SampleRandomNumberInRange(min : Int, max : Int) : Int {
      mutable output = 0;
      repeat {
        mutable bits = [];
        for idxBit in 1..BitSizeI(max) {
          set bits += [GenerateRandomBit()];
        }
        set output = ResultArrayAsInt(bits);
      } until (min < output and output <= max);
      return output;
    }
}
