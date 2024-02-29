
"""
    function build(model::Type{T}, data::Dict{String, Any}) where T <: MyAbstractGraphModel
"""
function build(model::Type{T}, data::Array{Int64,2}) where T <: MyAbstractGraphModel

    # build and empty graph model -
    graphmodel = model();
    number_of_nodes = size(data, 1); # see: https://docs.julialang.org/en/v1/base/arrays/#Base.size
    nodes = Dict{Int64, MyGraphNodeModel}();
    edges = Dict{Tuple{Int64, Int64}, Int64}();
    children = Dict{Int64, Set{Int64}}();

    # TODO: populate the nodes dictionary
    # ...

    # TODO: populate the edges dictionary
    # ...

    # TODO: populate the children dictionary
    # ...

    # add stuff to model -
    graphmodel.nodes = nodes;
    graphmodel.edges = edges;
    graphmodel.children = children;

    # return -
    return graphmodel;
end