abstract type AbstractChemicalReactionType end
abstract type AbstractConnectivityMatrixType end

"""
    MyChemicalReactionModel

The `MyChemicalReactionModel` type is a mutable model of a chemical reaction.
It contains the fields `name`, `reactants`, `products`, `reversible` and `stoichiometry`.
"""
mutable struct MyChemicalReactionModel <: AbstractChemicalReactionType
    
    # data -
    name::String
    type::Union{Int64, Nothing}
    catalyst::Union{String, Nothing}
    reactants::String
    products::String
    reversible::Bool
    stoichiometry::Dict{String, Float64}

    # constructor
    MyChemicalReactionModel() = new()
end

"""
    MyStoichiometricMatrixModel

The `MyStoichiometricMatrixModel` type is a mutable model of a stoichiometric matrix. 
It contains the fields `species`, `reactions` and `matrix`.
"""
mutable struct MyStoichiometricMatrixModel <: AbstractConnectivityMatrixType
    
    # data -
    species::Array{String,1}
    reactions::Array{String,1}
    matrix::Array{Float64,2}

    # constructor
    MyStoichiometricMatrixModel() = new()
end