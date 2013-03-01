$(document).ready(function () {
    $('#event_create').on('click', function () {
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
        var type_leave_id = $('#type_leave_id').val()
        var type_leave = $('#type_leave_id option:selected').text()
        $('#calenderevent').modal('hide');
        $.ajax({
            dataType:'json',
            type:'post',
            url:"leavemanagements/",
            data:{
                'leavemanagement[leave_type]':type_leave_id,
                'leavemanagement[start_date]':start_date,
                'leavemanagement[end_date]':end_date,
                '_method':'POST'

            },
            success:function (data) {
                $('#calendar').fullCalendar('renderEvent',
                    {
                        title:type_leave,
                        start:new Date(start_date.substring(6), start_date.substring(3, 5) - 1, start_date.substring(0, 2)),
                        end:new Date(end_date.substring(6), end_date.substring(3, 5) - 1, end_date.substring(0, 2)),
                        allDay:true
                    }, true
                );
            }
        });
    })
    var calendar = $('#calendar').fullCalendar({
        theme:true,
        header:{
            left:'prev',
            center:'title , today',
            right:'next'
        },
        selectable:true,
        selectHelper:true,
        select:function (startDate, endDate, allDay, jsEvent, view) {
            var okToAdd = true;
            if(startDate.getDay() == 0 || startDate.getDay() == 6){
                okToAdd = false;
            }
            $('#calendar').fullCalendar('clientEvents', function (event) {
                if ((startDate >= event.start && endDate <= event.end) || // between
                    (startDate <= event.start && endDate >= event.start) || // starts before, ends during
                    (startDate >= event.start && startDate <= event.end && endDate >= event.end)  // starts during, ends after
                    ) {
                    okToAdd = false;
                }
            });

            if (okToAdd) 
            {
                var year = startDate.getFullYear();
                var month = startDate.getMonth();
                month++;
                month = '' + month
                var day = '' + startDate.getDate();
                day = day.length < 2 ? "0" + day : day;
                month = month.length < 2 ? "0" + month : month;
                $('#start_date').val(day + "-" + month + "-" + year)
                $('#end_date').val(day + "-" + month + "-" + year)
                $('#calenderevent').modal('show');
            }
            calendar.fullCalendar('unselect');


        },
        eventClick: function(event) {
            calendar.fullCalendar('refetchEvents');
            alert(event.title)
        },
        events:function (start, end, callback) {
            $.ajax({
                url:'/events',
                dataType:'json',
                cache: true,
                success:function (doc) {
                    var events = []
                    for (event = 0; event < doc.data.length; event++) {
                        events.push({
                            title:doc.data[event].title,
                            start:new Date(doc.data[event].start.substring(0, 4), doc.data[event].start.substring(5, 7) - 1, doc.data[event].start.substring(8, 10)),
                            end:doc.data[event].end == undefined ? "" : new Date(doc.data[event].end.substring(0, 4), doc.data[event].end.substring(5, 7) - 1, doc.data[event].end.substring(8, 10)),
                            allDay:true
                        })
                    }
                    callback(events)
                }
            });
        }
    });
});