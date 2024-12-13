#InstEnum: *"ICB" | "IEE" | "IMPS"

#RecType: {
  id: int
  name: string
  active?: bool
  // ONE inst
  inst: #InstEnum 
  // LIST of insts...
  insts: [...#InstEnum]
}
