namespace ExploringSuperposition {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics; // 診断（DumpMachine）
    open Microsoft.Quantum.Math; // 計算（ArcCos）
    open Microsoft.Quantum.Convert; // 変換（Result型 -> Bool型 -> Int型）
    open Microsoft.Quantum.Arrays; // 配列操作（ForEach）
    
    /// # Summary
    /// プログラムの状態をダンプする
    // @EntryPoint()
    operation GenerateRandomBit() : Result {
      use q = Qubit();
      // 量子ビット割り当て
      Message("Initialized qubit:");
      DumpMachine();
      Message("");
      // Hadamard変換（アダマールゲート）
      H(q);
      Message("Qubit after applying H:");
      DumpMachine();
      Message("");
      // 量子ビット測定
      let randomBit = M(q);
      Message("Qubit after the measurement:");
      DumpMachine();
      Message("");
      // 量子ビットリセット
      Reset(q);
      Message("Qubit after resetting:");
      DumpMachine();
      Message("");
      return randomBit;
    }

    /// # Summary
    /// 偏りのある乱数ビットジェネレータ
    // @EntryPoint()
    operation GenerateSpecificState(alpha : Double) : Result {
      use q = Qubit();
      // Zero の確率が alpha、One の確率が 1 - alpha
      Ry(2.0 * ArcCos(Sqrt(alpha)), q);
      Message("The qubit is in the desired state.");
      Message("");
      DumpMachine();
      Message("");
      Message("Your skewed random bit is:");
      return M(q);
    }

    /// # Summary
    /// 多量子ビットの重ね合わせ
    // @EntryPoint()
    operation GenerateRandomNumber() : Int {
      // 量子ビット配列
      use qubits = Qubit[3];
      // 量子ビット配列のそれぞれの値にHadamard変換を適用
      ApplyToEach(H, qubits);
      Message("The qubit register in a uniform superposition: ");
      DumpMachine();
      // 量子ビット配列測定
      let result = ForEach(M, qubits);
      Message("Measuring the qubits collapses the superposition to a basis state.");
      DumpMachine();
      // 変換：Result配列 -> Bool配列 -> Int配列
      return BoolArrayAsInt(ResultArrayAsBoolArray(result));
    }

    /// # Summary
    /// 多量子ビットの重ね合わせ（過程）
    @EntryPoint()
    operation GenerateUniformState() : Int {
      use qubits = Qubit[3];
      ApplyToEach(H, qubits);
      Message("The qubit register in a uniform superposition: ");
      DumpMachine();
      mutable results = [];
      for q in qubits {
        Message("");
        set results += [M(q)];
        DumpMachine();
      }
      Message("Measuring the qubits collapses the superposition to a basis state.");
      DumpMachine();
      return BoolArrayAsInt(ResultArrayAsBoolArray(results));
    }
}
