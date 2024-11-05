function arrow_handle = plotArrow(ax, x, y)
    pos = ax.Position;
    pos(3:4) = pos(3:4) + pos(1:2);
    X = interp1(ax.XLim, pos([1 3]), x);
    Y = interp1(ax.YLim, pos([2 4]), y);
    
    arrow_handle = gobjects(1, size(x,1));
    for i=1:size(x,1)
        %annotation('textbox', [.6 .3 .7 .27],'EdgeColor','none','String',label,'FontSize',13,'Linewidth',2)
        arrow_handle(i*2 -1) = annotation('textarrow',X(i,:), Y(i,:),'FontSize',13,'Linewidth',2);
        arrow_handle(i*2) = annotation('textarrow',flip(X(i,:)), flip(Y(i,:)),'String','','FontSize',13,'Linewidth',2);
    end
end