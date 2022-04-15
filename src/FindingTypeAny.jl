module FindingTypeAny
export findingtypeany

const highlighting = Dict{Symbol, Bool}(
    :warntype => true,
    :llvm => true,
    :native => true,
)

function findingtypeany(@nospecialize(f), @nospecialize(t))
    v= code_typed(f,t)
    hasany = false
    for vi in v
        iname = vi[1].slotnames
        itype = vi[1].slottypes
        println("Variables: ")
        println(iname)
        for i =1:length(iname)
            ty = itype[i]
            println("#$i ", iname[i],"::$ty")
            if !highlighting[:warntype]
                #print(io, str)
            elseif ty isa Union && Base.is_expected_union(ty)
                #Base.emphasize(io, str, Base.warn_color()) # more mild user notification
            elseif ty isa Type && (!Base.isdispatchelem(ty) || ty == Core.Box)
                println("Type instability is detected! the variable is $(iname[i]) ::$ty")
                hasany = true
            else
                #Base.printstyled(io, str, color=:cyan) # show the "good" type
            end

        end
        #println(itype)
        #println(typeof(itype))

    end
    return hasany
end
# Write your package code here.

end
