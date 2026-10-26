import ELFSage.Types.Segment
import ELFSage.Types.ProgramHeaderTable

/-!
Unit checks for `ProgramHeaderTableEntry.toSegment?`'s flag decoding: `segment_flags` is
(readable, writable, executable), true when the corresponding `p_flags` bit (PF_R = 4,
PF_W = 2, PF_X = 1) is set.
-/

private def phteWithFlags (flags : UInt32) : ELF64ProgramHeaderTableEntry :=
  { p_type := 1, p_flags := flags, p_offset := 0, p_vaddr := 0, p_paddr := 0,
    p_filesz := 0, p_memsz := 0, p_align := 0 }

private def hasFlags (flags : UInt32) (expected : Bool × Bool × Bool) : Bool :=
  match ProgramHeaderTableEntry.toSegment? (phteWithFlags flags) ByteArray.empty with
  | .ok seg => seg.segment_flags == expected
  | .error _ => false

#guard hasFlags 0x4 (true, false, false)   -- R
#guard hasFlags 0x5 (true, false, true)    -- R E
#guard hasFlags 0x6 (true, true, false)    -- RW
#guard hasFlags 0x0 (false, false, false)
#guard hasFlags 0x7 (true, true, true)
