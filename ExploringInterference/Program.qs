namespace ExploringInterference {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    
    /// # Summary
    /// 2つの状態の干渉
    // @EntryPoint()
    operation TestInterference1() : Result {
      use q = Qubit();
      Message(" ");
      Message("At the beginning the qubit is in the state |0>.");
      DumpMachine();
      // H |0>
      H(q);
      Message(" ");
      Message("After applying H the qubit is in a uniform superposition.");
      DumpMachine();
      // 2回 H 演算を行う = 2つの状態を重ね合わせる のと同じになる
      H(q);
      Message(" ");
      Message("If we apply H again, interference gives back the state to |0>.");
      DumpMachine();
      Message(" ");
      Message("If we measure we always obtain 'Zero'.");
      return MResetZ(q);
    }

    /// # Summary
    /// 相対位相
    // @EntryPoint()
    operation TestInterference2() : Unit {
      use q = Qubit();
      // X 演算（Pauli X ゲート）を使用し、|0> から |1> に。
      X(q);
      // 状態 |Ψ2> を取得
      H(q);
      DumpMachine();
      Reset(q);
    }

    /// # Summary
    /// 複素数の振幅
    @EntryPoint()
    operation TestInterference3() : Unit {
      use q = Qubit();
      // Y 演算（Pauli Y ゲート）
      Y(q);
      H(q);
      DumpMachine();
      Reset(q);
    }
}
