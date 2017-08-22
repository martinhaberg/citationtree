function [ indexList ] = findPaperIndex( graph, paperKey )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

indexList = find(ismember(graph.Nodes.Keys, paperKey));
end

