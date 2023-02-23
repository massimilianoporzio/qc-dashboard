part of 'menu_cubit.dart';

class MenuState extends Equatable {
  final String activeItem;
  final String hoverItem;

  const MenuState({
    required this.activeItem,
    required this.hoverItem,
  });
  factory MenuState.initial() => const MenuState(
        activeItem: SideMenuConstants.overviewPage,
        hoverItem: "",
      );
  @override
  String toString() =>
      'MenuState(activeItem: $activeItem, hoverItem: $hoverItem)';

  @override
  List<Object> get props => [activeItem, hoverItem];

  MenuState copyWith({
    String? activeItem,
    String? hoverItem,
  }) {
    return MenuState(
      activeItem: activeItem ?? this.activeItem,
      hoverItem: hoverItem ?? this.hoverItem,
    );
  }
}
