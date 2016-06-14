<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<div id="sidebar">
					<c:if test="${not empty sessionScope.session_user }">
					<a href="/Pink_Flamingos/NewPost" class="action-button"><i class="fa fa-plus-circle"></i>&nbsp;&nbsp;Create Post</a>
					</c:if>
				</div>

				<div class="clear"></div>