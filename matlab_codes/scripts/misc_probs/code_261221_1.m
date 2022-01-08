clear; clc; close all;

% Description: Validates the Lattice Spring Model of a cantilever beam


%%  Beam parameters
L   = 2;        % No. of layers in the beam
N   = 11;       % No. of nodes in the beam/layer
h   = 0.02;     % Spacing of nodes

%% Simulation parameters
ftip    = 0.0010422;    % Tip force
mu      = 0.1;      % Damping coefficient
ko      = 10;       % Stiffness of orthogonal springs
kd      = ko/2;       % Stiffness of non-orthogonal springs
dt      = 0.001;    % Time step
tsim    = 300;       % Simulation time
            
%% Create beam
lsm = create_beam(h,L,N);

%% Time loop
tspan = 0:dt:tsim;
nt = numel(tspan);

for t = 1:nt
    
    %% Initialize the node forces to zero
    [lsm(:,:).fx] = deal(0);
    [lsm(:,:).fy] = deal(0);
    
    %% Apply tip force
    lsm(end,1).fx = ftip/2;
    lsm(end,2).fx = ftip/2;
    
    %% Calculate horizontal link forces
    for iN = 1:N
        % Master and slave layers
        masterL = 1; slaveL = 2;
        % Master and slave nodes
        masterN = iN; slaveN = iN;
        F = spring_force(ko,lsm(masterN,masterL),lsm(slaveN,slaveL));
        lsm = gather_forces(masterL,masterN,slaveL,slaveN,lsm,F);
    end
    
    %% Calculate vertical link forces
    for iL = 1:L
        for iN = 1:N-1
            masterL = iL; slaveL = iL;
            masterN = iN; slaveN = iN+1;
            F = spring_force(ko,lsm(masterN,masterL),lsm(slaveN,slaveL));
            lsm = gather_forces(masterL,masterN,slaveL,slaveN,lsm,F);
        end
    end
    
    %% Calculate diagonal link forces (Positive slope)
    for iL = 1:L-1
        for iN = 1:N-1
            masterL = iL; slaveL = iL+1;
            masterN = iN; slaveN = iN+1;
            F = spring_force(kd,lsm(masterN,masterL),lsm(slaveN,slaveL));
            lsm = gather_forces(masterL,masterN,slaveL,slaveN,lsm,F);
        end
    end
    
        %% Calculate diagonal link forces (Negative slope)
    for iL = 1:L-1
        for iN = 2:N
            masterL = iL; slaveL = iL+1;
            masterN = iN; slaveN = iN-1;
            F = spring_force(kd,lsm(masterN,masterL),lsm(slaveN,slaveL));
            lsm = gather_forces(masterL,masterN,slaveL,slaveN,lsm,F);
        end
    end
    
    %% Fix the first node
    lsm(1,1).fx = 0;
    lsm(1,1).fy = 0;
    lsm(1,2).fx = 0;
    lsm(1,2).fy = 0;
    
    %% Update nodes positions
    for iL = 1:L
        for iN = 2:N
            lsm(iN,iL).x = lsm(iN,iL).x + dt/mu*lsm(iN,iL).fx;
            lsm(iN,iL).y = lsm(iN,iL).y + dt/mu*lsm(iN,iL).fy;
        end
    end
    
    %% Visualize the deflection
    if mod(t,5000) == 0
        visualize_beam(t,lsm,nt)
    end
end

function lsm = gather_forces(masterL,masterN,slaveL,slaveN,lsm,F)
        % Assign forces to nodes
        lsm(masterN,masterL).fx = lsm(masterN,masterL).fx + F.x;
        lsm(masterN,masterL).fy = lsm(masterN,masterL).fy + F.y;
        lsm(slaveN,slaveL).fx = lsm(slaveN,slaveL).fx - F.x;
        lsm(slaveN,slaveL).fy = lsm(slaveN,slaveL).fy - F.y;
end

function lsm = create_beam(h,L,N)
    % Create beam structure
    x0 = 0; y0 = 0;
    for iL = 1:L
        x = x0 + (iL-1)*h;
        for iN = 1:N
            y = y0 + (iN-1)*h;
            lsm(iN,iL).x = x;
            lsm(iN,iL).y = y;
            lsm(iN,iL).xo = x;
            lsm(iN,iL).yo = y;
            lsm(iN,iL).fx = 0;
            lsm(iN,iL).fy = 0;
        end
    end
end

% Function to calculate force between two nodes connected by a spring
function F = spring_force(k,master,slave)
    % Calculate resting length
    rl = norm([(slave.xo-master.xo),(slave.yo-master.yo)]);
    % Calculate the current distance between the two nodes
    d = norm([(slave.x-master.x),(slave.y-master.y)]);
    
    % Calculate the forces
    F.x = k*(1-rl/d)*(slave.x-master.x);
    F.y = k*(1-rl/d)*(slave.y-master.y);
end

% Function to visualize beam
function visualize_beam(t,lsm,nt)
    % Visualize the beam
    N = size(lsm,1);
    L = size(lsm,2);
    figure(1)
    subplot(1,2,1)
    cla
    hold on
    for iL = 1:L
        for iN = 1:N
            % Nodes
            plot(lsm(iN,iL).x,lsm(iN,iL).y,'ro')
                % Horizontal links
                try plot([lsm(iN,iL).x,lsm(iN+1,iL+1).x],[lsm(iN,iL).y,lsm(iN+1,iL+1).y],'k-');catch; end
%                 % Diagonal links
                try plot([lsm(iN,iL).x,lsm(iN,iL+1).x],[lsm(iN,iL).y,lsm(iN+1,iL+1).y],'k-');catch; end
                try plot([lsm(iN+1,iL).x,lsm(iN,iL+1).x],[lsm(iN+1,iL).y,lsm(iN,iL+1).y],'k-');catch; end
%                 % Vertical links
%                 try plot([lsm(iN,iL).x,lsm(iN,iL).x],[lsm(iN,iL).y,lsm(iN+1,iL).y],'k-');catch; end
%                 try plot([lsm(iN,iL+1).x,lsm(iN,iL+1).x],[lsm(iN,iL).y,lsm(iN+1,iL).y],'k-');catch; end
        end
    end
    %xlim([-10*lsm(end,end).xo,10*lsm(end,end).xo])
    %ylim([0,1.5*lsm(end,end).yo])
    h = 0.02;
    xlim([-6*h 6*h])
    ylim([0 12*h])
    axis equal
    
    subplot(1,2,2)
    hold on
%     for iL = 1:L
%         for iN = 1:N
%             quiver(lsm(iN,iL).x,lsm(iN,iL).y,lsm(iN,iL).fx,lsm(iN,iL).fy,0.05,'k')
%             plot(lsm(iN,iL).x,lsm(iN,iL).y,'ro')
%         end
%     end
    plot(t,(lsm(end,1).x+lsm(end,2).x)/2-0.02/2,'rx')
    xlim([1 nt])
%     axis equal
end

% Function to calculate forces between two nodes of lsm