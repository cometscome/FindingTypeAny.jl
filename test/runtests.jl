using FindingTypeAny
using Test

@testset "FindingTypeAny.jl" begin
    # Write your tests here.

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
end
