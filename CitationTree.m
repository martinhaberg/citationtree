clear
clc

%% Prepare empty graph
G = digraph;
G.Nodes.Keys = {};

%% Import reference data
RefLists

%% Build statistics
G.Nodes.OutDegree = centrality(G,'outdegree');
G.Nodes.InDegree = centrality(G,'indegree');
G.Nodes.OutCloseness = centrality(G,'outcloseness');
G.Nodes.InCloseness = centrality(G,'incloseness');
G.Nodes.Betweenness = centrality(G,'betweenness');
G.Nodes.Pagerank = centrality(G,'pagerank');
G.Nodes.Hubs = centrality(G,'hubs');
G.Nodes.Authorities = centrality(G,'authorities');


inrank = centrality(G,'indegree');
rank = max([centrality(G,'indegree'),centrality(G,'outdegree')]');
rank1 = find(rank == 1);
rank2 = find(rank > 1);
inrank3 = find(inrank > 2);
inrank6 = find(inrank > 5);

%% Plot and format citation tree
figure(1)
p = plot(G,'NodeLabel', G.Nodes.Keys,'layout','force');

for i = 1:length(rank1)
    p.NodeLabel{rank1(i)} = '';%{''};%G.Nodes.Keys(rank3);
end
highlight(p,rank1,'Marker','none');
highlight(p,inrank3,'MarkerSize',8,'NodeColor','r');
highlight(p,inrank6,'MarkerSize',12,'NodeColor','y');

%% Plot statistics
figure(2)
nPlots = 4;
i = 1;

% subplot(nPlots,2,i)
% bar(G.Nodes.OutDegree)
% title('OutDegree')
% Top5table = sortrows(G.Nodes,{'OutDegree'},'descend');
% subplot(nPlots,2,i+1)
% barh(flipud(Top5table.OutDegree(1:5)))
% title('Top 5')
% set(gca,'yticklabel',flipud(Top5table.Keys(1:5)))
% i = i+2;

subplot(nPlots,2,i)
bar(G.Nodes.InDegree)
title('InDegree')
Top5table = sortrows(G.Nodes,{'InDegree'},'descend');
subplot(nPlots,2,i+1)
barh(flipud(Top5table.InDegree(1:5)))
set(gca,'yticklabel',flipud(Top5table.Keys(1:5)))
ylim([0 5+1])
i = i+2;

% subplot(nPlots,2,i)
% bar(G.Nodes.OutCloseness)
% title('OutCloseness')
% Top5table = sortrows(G.Nodes,{'OutCloseness'},'descend');
% subplot(nPlots,2,i+1)
% barh(flipud(Top5table.OutCloseness(1:5)))
% set(gca,'yticklabel',flipud(Top5table.Keys(1:5)))
% ylim([0 5+1])
% i = i+2;

% subplot(nPlots,2,i)
% bar(G.Nodes.InCloseness)
% title('InCloseness')
% Top5table = sortrows(G.Nodes,{'InCloseness'},'descend');
% subplot(nPlots,2,i+1)
% barh(flipud(Top5table.InCloseness(1:5)))
% set(gca,'yticklabel',flipud(Top5table.Keys(1:5)))
% ylim([0 5+1])
% i = i+2;

subplot(nPlots,2,i)
bar(G.Nodes.Betweenness)
title('Betweenness')
Top5table = sortrows(G.Nodes,{'Betweenness'},'descend');
subplot(nPlots,2,i+1)
barh(flipud(Top5table.Betweenness(1:5)))
set(gca,'yticklabel',flipud(Top5table.Keys(1:5)))
ylim([0 5+1])
i = i+2;

subplot(nPlots,2,i)
bar(G.Nodes.Pagerank)
title('Pagerank')
Top5table = sortrows(G.Nodes,{'Pagerank'},'descend');
subplot(nPlots,2,i+1)
barh(flipud(Top5table.Pagerank(1:5)))
set(gca,'yticklabel',flipud(Top5table.Keys(1:5)))
ylim([0 5+1])
i = i+2;

% subplot(nPlots,2,i)
% bar(G.Nodes.Hubs)
% title('Hubs')
% Top5table = sortrows(G.Nodes,{'Hubs'},'descend');
% subplot(nPlots,2,i+1)
% barh(flipud(Top5table.Hubs(1:5)))
% set(gca,'yticklabel',flipud(Top5table.Keys(1:5)))
% ylim([0 5+1])
% i = i+2;

subplot(nPlots,2,i)
bar(G.Nodes.Authorities)
title('Authorities')
Top5table = sortrows(G.Nodes,{'Authorities'},'descend');
subplot(nPlots,2,i+1)
barh(flipud(Top5table.Authorities(1:5)))
set(gca,'yticklabel',flipud(Top5table.Keys(1:5)))
ylim([0 5+1])
