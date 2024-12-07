package my_proj

#BasicType: string | int

meta: [string]: #BasicType | [...#BasicType]

#SuitType: or(meta.suits)
