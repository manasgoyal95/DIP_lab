word = 'ABBAS';
code = arithmetic_cod(word)

function code = arithmetic_cod(word)
alphabet = ['A', 'B', 'S'];
prob = [2/5, 2/5, 1/5];
l = 0;
r = 1;
cumulative_prob = [0, cumsum(prob)];


for i = 1:length(word)
    
    symbol_idx = find(alphabet == word(i));
    symbol_left = l + (r- l) * cumulative_prob(symbol_idx);
    symbol_right = l + (r - l) * cumulative_prob(symbol_idx+1);
    
    
    l = symbol_left;
    r = symbol_right;
end


code = (l + r) / 2;
end
