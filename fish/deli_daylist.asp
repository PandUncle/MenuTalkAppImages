<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc/asp_const.asp"-->
<!--#include file="inc/asp_framework.asp"-->
<!--#include file="inc/asp_fc.asp"-->
<!--#include file="inc/checklogin.asp"-->
<!--#include file="connection/conn.asp"-->
<%  call fc_checkflag(6) %>
<%
startdate=request("startdate")
enddate=request("enddate")
 if startdate="" then startdate=dateadd("d",Date(),0) end if
 if startdate<>"" and enddate="" then enddate=startdate end if
 if enddate="" then enddate=dateadd("d",Date(),0) end if
 if datediff("d",startdate,enddate)<0 then
	 tmpenddate=enddate
	 enddate=startdate
     startdate=tmpenddate
 end if
%>
<!DOCTYPE html>
<html>
  
<head>
    <title>Take Out List</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/se7en-font.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/isotope.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/jquery.fancybox.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/fullcalendar.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/wizard.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/select2.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/morris.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/datatables.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/datepicker.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/timepicker.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/colorpicker.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/bootstrap-switch.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/daterange-picker.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/typeahead.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/summernote.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/pygments.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/style1024.css" media="all" rel="stylesheet" type="text/css" /><link href="stylesheets/color/green.css" media="all" rel="alternate stylesheet" title="green-theme" type="text/css" /><link href="stylesheets/color/orange.css" media="all" rel="alternate stylesheet" title="orange-theme" type="text/css" /><link href="stylesheets/color/magenta.css" media="all" rel="alternate stylesheet" title="magenta-theme" type="text/css" /><link href="stylesheets/color/gray.css" media="all" rel="alternate stylesheet" title="gray-theme" type="text/css" /><script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script><script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script><script src="javascripts/bootstrap.min.js" type="text/javascript"></script><script src="javascripts/raphael.min.js" type="text/javascript"></script><script src="javascripts/selectivizr-min.js" type="text/javascript"></script><script src="javascripts/jquery.mousewheel.js" type="text/javascript"></script><script src="javascripts/jquery.vmap.min.js" type="text/javascript"></script><script src="javascripts/jquery.vmap.sampledata.js" type="text/javascript"></script><script src="javascripts/jquery.vmap.world.js" type="text/javascript"></script><script src="javascripts/jquery.bootstrap.wizard.js" type="text/javascript"></script><script src="javascripts/fullcalendar.min.js" type="text/javascript"></script><script src="javascripts/gcal.js" type="text/javascript"></script><script src="javascripts/jquery.dataTables.min.js" type="text/javascript"></script><script src="javascripts/datatable-editable.js" type="text/javascript"></script><script src="javascripts/jquery.easy-pie-chart.js" type="text/javascript"></script><script src="javascripts/excanvas.min.js" type="text/javascript"></script><script src="javascripts/jquery.isotope.min.js" type="text/javascript"></script><script src="javascripts/isotope_extras.js" type="text/javascript"></script><script src="javascripts/modernizr.custom.js" type="text/javascript"></script><script src="javascripts/jquery.fancybox.pack.js" type="text/javascript"></script><script src="javascripts/select2.js" type="text/javascript"></script><script src="javascripts/styleswitcher.js" type="text/javascript"></script><script src="javascripts/wysiwyg.js" type="text/javascript"></script><script src="javascripts/summernote.min.js" type="text/javascript"></script><script src="javascripts/jquery.inputmask.min.js" type="text/javascript"></script><script src="javascripts/jquery.validate.js" type="text/javascript"></script><script src="javascripts/bootstrap-fileupload.js" type="text/javascript"></script><script src="javascripts/bootstrap-datepicker.js" type="text/javascript"></script><script src="javascripts/bootstrap-timepicker.js" type="text/javascript"></script><script src="javascripts/bootstrap-colorpicker.js" type="text/javascript"></script><script src="javascripts/bootstrap-switch.min.js" type="text/javascript"></script><script src="javascripts/typeahead.js" type="text/javascript"></script><script src="javascripts/daterange-picker.js" type="text/javascript"></script><script src="javascripts/date.js" type="text/javascript"></script><script src="javascripts/morris.min.js" type="text/javascript"></script><script src="javascripts/skycons.js" type="text/javascript"></script><script src="javascripts/fitvids.js" type="text/javascript"></script><script src="javascripts/jquery.sparkline.min.js" type="text/javascript"></script><script src="javascripts/main.js" type="text/javascript"></script><script src="javascripts/respond.js" type="text/javascript"></script>
    <script type="text/javascript" src="layer_mobile/layer.js?2.x"></script>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta http-equiv="refresh" content="120" />
  </head>
  <body>
  <div id="menulist"> 
  <div class="col-lg-12">
<div class="widget-container fluid-height clearfix">
              <div class="heading">
                <i class="icon-table"></i><% =startdate%> <% if web_userflag<=2 then %><a href="deli_addorder.asp" class="btn btn-primary" target="_blank">Add</a> <a href="index.asp" class="btn btn-primary" target="_blank">Home</a> <% end if %>&nbsp;<a href="food_applist.asp" class="btn btn-primary" target="_blank">AppList</a>&nbsp; <a href="loginout.asp" class="btn btn-primary pull-right" >Login Out</a>
              </div>
<div class="widget-content padded clearfix">
<div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th width="18%">Deli No</th>
                        <th width="26%">Deli Time</th>
                        <th width="6%">Payment</th>
                        <th width="8%">Amount</th>
                        <th width="14%">Status</th>
                        <th width="28%">&nbsp;</th>
                      </tr>
                    </thead>
                    <tbody>
                    <% 
				 tmptotal=0
				 i=0
				 sql="select * from [DeliList] where datediff(day,ordertime,'"&startdate&"')<=0 and datediff(day,ordertime,'"&enddate&"')>=0 and Orderbranch='"&web_branch&"' order by ordertime desc,Id desc"
				 if web_userflag>2 then   '超级管理显示所有订单
			     sql="select * from [DeliList] where datediff(day,ordertime,'"&startdate&"')<=0 and datediff(day,ordertime,'"&enddate&"')>=0 and customerconfirm=1 and Orderbranch='"&web_branch&"' order by ordertime desc,Id desc"
				 end if
				 
	             set rs = Server.CreateObject("adodb.recordset")
		         rs.Open sql, conn, 1, 3
				 do while not rs.eof
				 i=i+1
				 nowstatus="" '初始化
				 tmptotal=tmptotal+rs("finalprice")
				 
				 if rs("status")=1 then nowstatus="Delivered" end if
				 if not isnull(rs("starttime")) then nowstatus="Making" end if
				 if not isnull(rs("starttime")) and rs("status")<1 then 
				   if isnull(rs("endtime")) then
					 nowstatus="Making "&datediff("n",rs("starttime"),now())&"mins" 
				   else
					 nowstatus="Prepared "&datediff("n",rs("starttime"),rs("endtime"))&"mins" 
				   end if
				 end if
				 if not isnull(rs("delistarttime")) then nowstatus="Delivering by "&rs("deliboy")
				 if not isnull(rs("deliArrivaltime")) then nowstatus="Arrivaled"
				 if not isnull(rs("deliendtime")) then nowstatus="Delivered"
				 
				    if isnull(rs("starttime")) or isnull(rs("updatetime")) then
					showupdate=0
					elseif datediff("s",Asp_Time(rs("starttime"), 1),Asp_Time(rs("updatetime"), 1))>0 then
					showupdate=1
					end if
					%>
                      <tr>
                        <td>#<% =rs("DeliNo")%> <% if isnull(rs("StartTime"))  then %><span class="label bg-danger">N</span> <% end if%>  <% if rs("fromcustomer")=1  then %><span class="label bg-success">C</span> <% end if%> <% if  rs("customerconfirm")=0  then %><span class="label bg-danger">U</span> <% end if%> </td>
                        <td><% =rs("DeliTime")%> | <% =rs("DeliWay")%> </td>
                        <td><% =rs("payment")%></td>
                        <td><% =rs("FinalPrice")%><% if rs("paystatus")=1 then%><span  style="color:red">|paid </span><%end if%></td>
                        <td><% =nowstatus %> </td>
                        <td> <a href="deli_detail.asp?orderno=<% =rs("orderno") %>" class="btn btn-primary" target="_blank">Detail</a>  </td>
                      </tr>
                      <% 
				  rs.movenext
				  loop
				  set rs=nothing
				  %>
                      <tr>
                        <td>Total</td>
                        <td>&nbsp; </td>
                        <td>&nbsp;</td>
                        <td colspan="2"><% =FormatNumber(tmptotal,-1,-1) %></td>
                        <td>&nbsp; </td>
                      </tr>
                    </tbody>
                  </table>
</div>
              </div>
             </div>
    </div>
</div>
 
  </body>
</html>