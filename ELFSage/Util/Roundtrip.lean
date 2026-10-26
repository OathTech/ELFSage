import ELFSage.Util.ByteArray

/-!
# Byte round-trip theorems proved by `bv_decide`

These theorems are proved by bit-blasting (`bv_decide`), so each depends on a per-theorem
native-checked certificate axiom (`*._native.bv_decide.ax_*`) in addition to Lean's standard
axioms. They are kept apart from `ELFSage.Util.ByteArray` so that the parsers and their
bounds proofs depend only on the standard axioms; nothing in the library imports this module.
It is a second root of the `ELFSage` library (see the lakefile), so it is built and checked
without being imported by `ELFSage`.
-/

@[simp]
theorem UInt16.byteCeiling :  ∀(i  : UInt16), (i >>> 0x8) % (256 : UInt16) = i >>> 0x8 := by
  bv_decide

theorem UInt16.shiftUnshift : ∀(i  : UInt16), i = (i >>> 0x8 % 256) <<< 0x8 ||| i % 256 := by
  bv_decide

theorem UInt32.shiftUnshift : ∀(i  : UInt32),
  i = (i >>> 0x18 % 256) <<< 0x18 |||
      (i >>> 0x10 % 256) <<< 0x10 |||
      (i >>> 0x08 % 256) <<< 0x08 |||
      i % 256 := by
  bv_decide

theorem UInt64.shiftUnshift : ∀(i  : UInt64),
  i = (i >>> 0x38 % 256) <<< 0x38 |||
      (i >>> 0x30 % 256) <<< 0x30 |||
      (i >>> 0x28 % 256) <<< 0x28 |||
      (i >>> 0x20 % 256) <<< 0x20 |||
      (i >>> 0x18 % 256) <<< 0x18 |||
      (i >>> 0x10 % 256) <<< 0x10 |||
      (i >>> 0x08 % 256) <<< 0x08 |||
      i % 256 := by
  bv_decide

theorem UInt16.ByteArray_roundtrip :
  ∀ i : UInt16, ∀l, i.getBytesBEfrom.getUInt16BEfrom 0 l = i := by
  intro i l

  simp [
    UInt16.getBytesBEfrom,
    ByteArray.getUInt16BEfrom,
  ]

  apply Eq.symm
  apply UInt16.shiftUnshift i
