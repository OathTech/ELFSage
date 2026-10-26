import Lake
open Lake DSL

package «ELFSage» where
  -- add package configuration options here

require Cli from git
  "https://github.com/leanprover/lean4-cli.git"@"28e0856d4424863a85b18f38868c5420c55f9bae"

lean_lib «ELFSage» where
  -- ELFSage.Util.Roundtrip is a second root: its bv_decide theorems are built and checked with
  -- the library, but `import ELFSage` does not pull their certificate axioms into a consumer.
  roots := #[`ELFSage, `ELFSage.Util.Roundtrip]

@[default_target]
lean_exe «elfsage» where
  root := `Main

lean_exe test where
  root := `Test
