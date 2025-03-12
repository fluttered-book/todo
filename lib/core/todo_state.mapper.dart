// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'todo_state.dart';

class TodoStateMapper extends ClassMapperBase<TodoState> {
  TodoStateMapper._();

  static TodoStateMapper? _instance;
  static TodoStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TodoStateMapper._());
      TodoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TodoState';

  static TodoStatus _$status(TodoState v) => v.status;
  static const Field<TodoState, TodoStatus> _f$status =
      Field('status', _$status);
  static List<Todo> _$todos(TodoState v) => v.todos;
  static const Field<TodoState, List<Todo>> _f$todos = Field('todos', _$todos);

  @override
  final MappableFields<TodoState> fields = const {
    #status: _f$status,
    #todos: _f$todos,
  };

  static TodoState _instantiate(DecodingData data) {
    return TodoState(status: data.dec(_f$status), todos: data.dec(_f$todos));
  }

  @override
  final Function instantiate = _instantiate;

  static TodoState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TodoState>(map);
  }

  static TodoState fromJson(String json) {
    return ensureInitialized().decodeJson<TodoState>(json);
  }
}

mixin TodoStateMappable {
  String toJson() {
    return TodoStateMapper.ensureInitialized()
        .encodeJson<TodoState>(this as TodoState);
  }

  Map<String, dynamic> toMap() {
    return TodoStateMapper.ensureInitialized()
        .encodeMap<TodoState>(this as TodoState);
  }

  TodoStateCopyWith<TodoState, TodoState, TodoState> get copyWith =>
      _TodoStateCopyWithImpl(this as TodoState, $identity, $identity);
  @override
  String toString() {
    return TodoStateMapper.ensureInitialized()
        .stringifyValue(this as TodoState);
  }

  @override
  bool operator ==(Object other) {
    return TodoStateMapper.ensureInitialized()
        .equalsValue(this as TodoState, other);
  }

  @override
  int get hashCode {
    return TodoStateMapper.ensureInitialized().hashValue(this as TodoState);
  }
}

extension TodoStateValueCopy<$R, $Out> on ObjectCopyWith<$R, TodoState, $Out> {
  TodoStateCopyWith<$R, TodoState, $Out> get $asTodoState =>
      $base.as((v, t, t2) => _TodoStateCopyWithImpl(v, t, t2));
}

abstract class TodoStateCopyWith<$R, $In extends TodoState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Todo, TodoCopyWith<$R, Todo, Todo>> get todos;
  $R call({TodoStatus? status, List<Todo>? todos});
  TodoStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TodoStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TodoState, $Out>
    implements TodoStateCopyWith<$R, TodoState, $Out> {
  _TodoStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TodoState> $mapper =
      TodoStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Todo, TodoCopyWith<$R, Todo, Todo>> get todos =>
      ListCopyWith(
          $value.todos, (v, t) => v.copyWith.$chain(t), (v) => call(todos: v));
  @override
  $R call({TodoStatus? status, List<Todo>? todos}) => $apply(FieldCopyWithData(
      {if (status != null) #status: status, if (todos != null) #todos: todos}));
  @override
  TodoState $make(CopyWithData data) => TodoState(
      status: data.get(#status, or: $value.status),
      todos: data.get(#todos, or: $value.todos));

  @override
  TodoStateCopyWith<$R2, TodoState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TodoStateCopyWithImpl($value, $cast, t);
}
