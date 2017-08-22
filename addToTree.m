function [ graph ] = addToTree( graph, refList )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


% Find index of paper to be added
paperKey = inputname(2);
paperIndex = [];
if (~isempty(graph.Nodes.Keys))
    paperIndex = findPaperIndex(graph,paperKey);
end
if (isempty(paperIndex))
    graph = addnode(graph,1);
    paperIndex = size(graph.Nodes,1);
    graph.Nodes.Keys(paperIndex) = {paperKey};
end

% Add citations
for i = 1:size(refList,1)
    citeKey = refList{i};
    citeIndex = findPaperIndex(graph,citeKey);
    
    % add reference to tree if currently not in tree
    if (isempty(citeIndex))
        %disp(strcat('citeIndex empty for  ',citeKey))
        graph = addnode(graph,1);
        citeIndex = size(graph.Nodes,1);
        graph.Nodes.Keys(citeIndex) = {citeKey};
        %disp(strcat('Node added for ', citeKey));
        % Check if reflist exists
        %if exist(citeKey) == 1
        %    disp(strcat('citeKey has reflist for ',citeKey));
        %    graph = addToTree(graph,eval(citeKey));
        %    disp('graph updated')
        %end

        
    end
    graph = addedge(graph,paperIndex,citeIndex);
    
end

end

