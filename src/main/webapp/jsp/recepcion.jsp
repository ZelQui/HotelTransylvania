<%@ page import="java.util.List" %>
<%@ page import="development.team.hoteltransylvania.Model.Room" %>
<%@ page import="development.team.hoteltransylvania.Business.GestionRoom" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recepción</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<%
  List<Room> rooms = GestionRoom.getAllRooms();
  int floors = GestionRoom.quantityFloors();
%>
<body>
<div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
  <h4><i class="fas fa-sign-in-alt"></i> Recepción</h4>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Recepción</li>
    </ol>
  </nav>
</div>

<!-- Pestañas -->
<ul class="nav nav-tabs flex-column flex-md-row mt-4">
  <li class="nav-item"><button class="nav-link active" data-bs-toggle="tab" data-bs-target="#todos">Todos</button></li>
  <%for (int i = 1; i <= floors ; i++) {%>
    <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#<%=i%>-nivel">Nivel <%=i%></button></li>
  <%}%>
</ul>

<!-- Contenido de pestañas -->
<div class="tab-content mt-3">

  <div id="todos" class="tab-pane fade show active">
    <div class="row">
      <%
        for (Room room : rooms) {
          String colorOfStatus;
          switch (room.getStatusRoom().getValue()) {
            case 2:
              colorOfStatus = "occupied";
              break;
            case 3:
              colorOfStatus = "warning";
              break;
            default:
              colorOfStatus = "available";
          }
          // Convertir el nombre del estado en tipo oración
          String statusName = room.getStatusRoom().getName().toLowerCase();
          statusName = statusName.substring(0, 1).toUpperCase() + statusName.substring(1);
      %>
      <div class="col-md-3">
        <button class="room-card <%= colorOfStatus %>" onclick="cargarPagina('jsp/procesarHabitacion.jsp')">
          <h5><%= room.getNumber() %></h5> <%-- Número --%>
          <span><%= room.getTypeRoom().getName().toUpperCase() %></span> <%-- Tipo --%>
          <i class="fas fa-bed room-icon"></i>
          <div class="room-status">
            <span><%= statusName %> </span> <%-- Estado --%>
            <i class="fas fa-arrow-right"></i>
          </div>
        </button>
      </div>
      <% } %>

    </div>
  </div>

  <%for (int i = 1; i <= floors ; i++) { int floor = i;%>
  <div id="<%=i%>-nivel" class="tab-pane fade show">
    <div class="row">
      <%
        List<Room> roomsFloor = rooms.stream()
                .filter(room -> room.getFloor() == floor)
                .collect(Collectors.toList());
        for (Room room : roomsFloor) {
          String colorOfStatus;
          switch (room.getStatusRoom().getValue()) {
            case 2:
              colorOfStatus = "occupied";
              break;
            case 3:
              colorOfStatus = "warning";
              break;
            default:
              colorOfStatus = "available";
          }
          // Convertir el nombre del estado en tipo oración
          String statusName = room.getStatusRoom().getName().toLowerCase();
          statusName = statusName.substring(0, 1).toUpperCase() + statusName.substring(1);
      %>
      <div class="col-md-3">
        <button class="room-card <%= colorOfStatus %>" onclick="cargarPagina('jsp/procesarHabitacion.jsp')">
          <h5><%= room.getNumber() %></h5> <%-- Número --%>
          <span><%= room.getTypeRoom().getName().toUpperCase() %></span> <%-- Tipo --%>
          <i class="fas fa-bed room-icon"></i>
          <div class="room-status">
            <span><%= statusName %> </span> <%-- Estado --%>
            <i class="fas fa-arrow-right"></i>
          </div>
        </button>
      </div>
      <% } %>
    </div>
  </div>
  <%}%>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  function handleClick(roomNumber) {
    alert("Has seleccionado la habitación " + roomNumber);
  }
</script>
</body>
</html>