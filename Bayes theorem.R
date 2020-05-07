# Bayes theorem
# P(A|B) = P(B|A)*P(A)/P(B)

# let us take an example of cystic fibrosis
# + <- positive test
# - <- negetive test
# D = 0 no disease
# D = 1 disease
# Probability of having the disease is P(D=1|+)
# 99% test accuract when disease is present P(+|D=1)=0.99
# 99% test accuract when disease is absent P(-|D=0)=0.99
# rate of cystic fibrosis = P(D-1)=0.00025

# bayes theorem
# P(D=1|+) = P(+|D=1)*P(D=1)/P(+)
# P(D=1|+) = P(+|D=1)*P(D=1)/P(+|D=1)*P(D=1)+P(+|D=0)*P(D=0)
0.99*0.00025/0.99*0.00025 + 0.01*0.99975
