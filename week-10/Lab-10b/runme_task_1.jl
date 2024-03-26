# include -
include("Include.jl")

# initialize -
dataset = Dict{String,DataFrame}();

# load the price dataset full dataset, remove firms with missing data -
original_dataset = MyPortfolioDataSet() |> x->x["dataset"];
maximum_number_trading_days = original_dataset["AAPL"] |> nrow;
for (ticker,data) ∈ original_dataset
    if (nrow(data) == maximum_number_trading_days)
        dataset[ticker] = data;
    end
end
my_list_of_tickers = keys(dataset) |> collect |> x->sort(x);

# what ticker is SPY?
idx_spy = findfirst(x->x=="SPY", my_list_of_tickers);

# compute the growth rate matrix -
market_matrix = μ(dataset, my_list_of_tickers) |> x-> transpose(x) |> Matrix;
rG = market_matrix[:,idx_spy]; # this is the growth rate of the market, which we apoproximate by the SPY ETF

# compute the singular value decomposition -
(U,Σ,V) = svd(market_matrix);