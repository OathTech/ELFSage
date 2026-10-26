/-!
Relocation type constants for x86-64 (`R_X86_64_*`), as in the System V AMD64 ABI and glibc's
`elf.h`. `r_info` packs a symbol table index and one of these types; see
`ELF64_R_SYM`/`ELF64_R_TYPE` in `ELFSage.Types.Relocation`.
-/

namespace ELFRelocation.X86_64

def R_X86_64_NONE : Nat := 0
def R_X86_64_64 : Nat := 1
def R_X86_64_PC32 : Nat := 2
def R_X86_64_GOT32 : Nat := 3
def R_X86_64_PLT32 : Nat := 4
def R_X86_64_COPY : Nat := 5
def R_X86_64_GLOB_DAT : Nat := 6
def R_X86_64_JUMP_SLOT : Nat := 7
def R_X86_64_RELATIVE : Nat := 8
def R_X86_64_GOTPCREL : Nat := 9
def R_X86_64_32 : Nat := 10
def R_X86_64_32S : Nat := 11
def R_X86_64_16 : Nat := 12
def R_X86_64_PC16 : Nat := 13
def R_X86_64_8 : Nat := 14
def R_X86_64_PC8 : Nat := 15
def R_X86_64_DTPMOD64 : Nat := 16
def R_X86_64_DTPOFF64 : Nat := 17
def R_X86_64_TPOFF64 : Nat := 18
def R_X86_64_TLSGD : Nat := 19
def R_X86_64_TLSLD : Nat := 20
def R_X86_64_DTPOFF32 : Nat := 21
def R_X86_64_GOTTPOFF : Nat := 22
def R_X86_64_TPOFF32 : Nat := 23
def R_X86_64_PC64 : Nat := 24
def R_X86_64_GOTOFF64 : Nat := 25
def R_X86_64_GOTPC32 : Nat := 26
def R_X86_64_GOT64 : Nat := 27
def R_X86_64_GOTPCREL64 : Nat := 28
def R_X86_64_GOTPC64 : Nat := 29
def R_X86_64_GOTPLT64 : Nat := 30
def R_X86_64_PLTOFF64 : Nat := 31
def R_X86_64_SIZE32 : Nat := 32
def R_X86_64_SIZE64 : Nat := 33
def R_X86_64_GOTPC32_TLSDESC : Nat := 34
def R_X86_64_TLSDESC_CALL : Nat := 35
def R_X86_64_TLSDESC : Nat := 36
def R_X86_64_IRELATIVE : Nat := 37
def R_X86_64_RELATIVE64 : Nat := 38
def R_X86_64_GOTPCRELX : Nat := 41
def R_X86_64_REX_GOTPCRELX : Nat := 42

/-- The name of an x86-64 relocation type, for printing. -/
def typeName (t : Nat) : String :=
  match t with
  | 0 => "R_X86_64_NONE" | 1 => "R_X86_64_64" | 2 => "R_X86_64_PC32" | 3 => "R_X86_64_GOT32"
  | 4 => "R_X86_64_PLT32" | 5 => "R_X86_64_COPY" | 6 => "R_X86_64_GLOB_DAT"
  | 7 => "R_X86_64_JUMP_SLOT" | 8 => "R_X86_64_RELATIVE" | 9 => "R_X86_64_GOTPCREL"
  | 10 => "R_X86_64_32" | 11 => "R_X86_64_32S" | 12 => "R_X86_64_16" | 13 => "R_X86_64_PC16"
  | 14 => "R_X86_64_8" | 15 => "R_X86_64_PC8" | 16 => "R_X86_64_DTPMOD64"
  | 17 => "R_X86_64_DTPOFF64" | 18 => "R_X86_64_TPOFF64" | 19 => "R_X86_64_TLSGD"
  | 20 => "R_X86_64_TLSLD" | 21 => "R_X86_64_DTPOFF32" | 22 => "R_X86_64_GOTTPOFF"
  | 23 => "R_X86_64_TPOFF32" | 24 => "R_X86_64_PC64" | 25 => "R_X86_64_GOTOFF64"
  | 26 => "R_X86_64_GOTPC32" | 27 => "R_X86_64_GOT64" | 28 => "R_X86_64_GOTPCREL64"
  | 29 => "R_X86_64_GOTPC64" | 30 => "R_X86_64_GOTPLT64" | 31 => "R_X86_64_PLTOFF64"
  | 32 => "R_X86_64_SIZE32" | 33 => "R_X86_64_SIZE64" | 34 => "R_X86_64_GOTPC32_TLSDESC"
  | 35 => "R_X86_64_TLSDESC_CALL" | 36 => "R_X86_64_TLSDESC" | 37 => "R_X86_64_IRELATIVE"
  | 38 => "R_X86_64_RELATIVE64" | 41 => "R_X86_64_GOTPCRELX" | 42 => "R_X86_64_REX_GOTPCRELX"
  | n => s!"R_X86_64_UNKNOWN({n})"

end ELFRelocation.X86_64
