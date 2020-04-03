typedef void EventCallBack(arg);

class EventBus {
  // 私有构造函数
  EventBus._internal();

  // 保存单例
  static EventBus _singleton = new EventBus._internal();

  // 工厂构造函数
  factory EventBus() => _singleton;

  // 保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  var _eventMap = new Map<Object, List<EventCallBack>>();

  // 添加订阅者
  void on(eventName, EventCallBack f) {
    if (eventName == null || f == null) return;
    _eventMap[eventName] ??= List<EventCallBack>();
    _eventMap[eventName].add(f);
  }

  // 移除订阅者
  void off(eventName, [EventCallBack f]) {
    var list = _eventMap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _eventMap[eventName] = null;
    }else {
      _eventMap.remove(f);
    }
  }

  // 触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _eventMap[eventName];
    if (list == null) return;

    for (var i = list.length - 1; i > -1 ; i--) {
      list[i](arg);
    }
  }
}