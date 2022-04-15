# FindingTypeAny

This small package can detect the type instability. 

## how to install 

```julia
add 
```

## simple usage

```julia
global_var = 0
function myfastfunc()::Float64
    i = global_var 
    for j in 1:10000
        i += Float64(j)
    end
    return i
end


hasany = findingtypeany(myfastfunc,Any)
println(hasany)
```

The output is 

```julia
Variables: 
[Symbol("#self#"), Symbol(""), :i, :j]
#1 #self#::var"#myfastfunc#1"{Int64}
#2 ::Union{Nothing, Tuple{Int64, Int64}}
#3 i::Union{Float64, Int64}
Type instability is detected! the variable is i ::Union{Float64, Int64}
#4 j::Int64
true
```