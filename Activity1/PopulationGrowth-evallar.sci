// Download scilab here: https://www.scilab.org

// In this activity, you will implement and compare two simulation approaches for population growth:
// 1. A *discrete model* where population changes happen at distinct, whole-number time intervals.
// 2. A *continuous model* that approximates smooth growth using small time steps (numerical integration).
// You'll observe how the choice of modeling approach and time step affects the simulation results.

// --- Model Parameters ---
// DO NOT MODIFY THESE
P0 = 100;
r  = 0.1;
T  = 20;
dt = 0.1;

// === Part 1: Discrete-Time (Annual Steps) ===
time_discrete = 0:1:T;
pop_discrete = zeros(1, length(time_discrete));
pop_discrete(1) = P0;
for i = 2:length(time_discrete)
    pop_discrete(i) = pop_discrete(i-1) * (1 + r);
end

// === Part 2: Continuous-Time (Euler’s Method) ===
time_cont = 0:dt:T;
pop_cont = zeros(1, length(time_cont));
pop_cont(1) = P0;
for i = 2:length(time_cont)
    pop_cont(i) = pop_cont(i-1) + r * pop_cont(i-1) * dt;
end

// === Part 3: Analytical Solution ===
time_exact = time_cont;  // same time grid for smooth curve
pop_exact = P0 * exp(r .* time_exact);

// === Part 4: Plot All Three Curves ===
clf(); scf(0);
plot(time_discrete, pop_discrete, 'b-o', time_cont, pop_cont, 'r-', time_exact, pop_exact, 'g--');
xlabel('Time (years)');
ylabel('Population');
title('Population Growth: Discrete, Euler, and Analytical Models');
legend(['Discrete (Δt=1)'; 'Euler (Δt=0.1)'; 'Exact exp(rt)'], 2);  // upper left :contentReference[oaicite:1]{index=1}
grid();
