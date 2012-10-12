jQuery ->
        $('#orders').dataTable
          sDom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
          sWrapper: "dataTables_wrapper form-inline"
          sPaginationType: "bootstrap"
          bJQueryUI: false
          bProcessing: true
          bServerSide: true
          sAjaxSource: $('#orders').data('source')
          aoColumnDefs: [bSortable: false, aTargets: [4]]
          aaSorting: [[2, "desc"]]
          oLanguage:
            sLengthMenu: "_MENU_ records per page"