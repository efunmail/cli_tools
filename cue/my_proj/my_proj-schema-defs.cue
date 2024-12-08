package my_proj

#BasicType: string | int

#WordRegex: "^[_a-zA-Z][_a-zA-Z0-9]*$" 
#ListNameRegex: "-(list|LIST)$"


meta: [string]: #BasicType | [...#BasicType]

#SuitType: or(meta.suits)
